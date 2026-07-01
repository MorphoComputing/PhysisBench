# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 2.870 A
- tm_score_ca_ordered: 0.4855018190358803
- heavy_atom_rmsd: 4.453 A
- sidechain_heavy_atom_rmsd: 5.252 A
- **all-atom quality (honest):** heavy 4.453 A, sidechain 5.252 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 865
- bin_accuracy: 0.597

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.870005686029776
- ga_delta_rmsd: -0.21811322111038667  ga_fitness_mode: energy
- pre_local_rmsd: 3.1726306448549972  localized_anchor_rmsd: 2.8700087102042593

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I1-V2 → 12 conflicts (57%); N17-C19 → 9 conflicts (43%)
- explained: 21/21 conflicts by 2 root cause(s)
- metrics: hubs=11 (frac 0.234), conflicts/hub=1.9, max_incompat=4.56Å, chain_span=0.787
- **fix-first:** [LOW_CONFLICT] Root cause(s): I1-V2 + N17-C19 — explain ~21/21 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C5** — severity 4.46, 4 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): P46@18.6Å(now 14.7,conf 0.37), T45@18.5Å(now 15.3,conf 0.37)
  - V2↔P46: targets 6.3/18.6Å but partners are 7.8Å apart → too_close_together by 4.6Å
  - V2↔T45: targets 6.3/18.5Å but partners are 8.8Å apart → too_close_together by 3.4Å
  - P46↔I1: targets 18.6/7.4Å but partners are 8.8Å apart → too_close_together by 2.4Å
- **C10** — severity 2.93, 3 conflict(s); suspect input ~`V2` (group: push_out)
  - push-out (wants farther): P46@21.2Å(now 17.7,conf 0.44), T45@20.3Å(now 17.6,conf 0.41), C19@17.9Å(now 14.3,conf 0.36)
  - P46↔V2: targets 21.2/9.7Å but partners are 7.8Å apart → too_close_together by 3.8Å
  - P46↔I1: targets 21.2/9.4Å but partners are 8.8Å apart → too_close_together by 3.0Å
  - T45↔V2: targets 20.3/9.7Å but partners are 8.8Å apart → too_close_together by 1.9Å
- **Q4** — severity 2.76, 2 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): P46@18.5Å(now 13.2,conf 0.37), T45@18.4Å(now 14.4,conf 0.37)
  - I1↔P46: targets 5.5/18.5Å but partners are 8.8Å apart → too_close_together by 4.1Å
  - I1↔T45: targets 5.5/18.4Å but partners are 9.5Å apart → too_close_together by 3.4Å
- **Q22** — severity 2.13, 3 conflict(s); suspect input ~`V36` (group: push_out)
  - push-out (wants farther): C19@19.1Å(now 14.8,conf 0.38), N17@17.9Å(now 14.9,conf 0.36)
  - C19↔V36: targets 19.1/13.7Å but partners are 3.1Å apart → too_close_together by 2.3Å
  - C19↔A32: targets 19.1/8.8Å but partners are 8.1Å apart → too_close_together by 2.1Å
  - N17↔L12: targets 17.9/10.4Å but partners are 5.7Å apart → too_close_together by 1.9Å
- **Q14** — severity 1.98, 2 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): P46@18.4Å(now 15.3,conf 0.37)
  - I1↔P46: targets 6.2/18.4Å but partners are 8.8Å apart → too_close_together by 3.4Å
  - P46↔V2: targets 18.4/8.6Å but partners are 7.8Å apart → too_close_together by 2.1Å
- **V20** — severity 1.70, 2 conflict(s); suspect input ~`N17` (group: push_out)
  - push-out (wants farther): N17@15.4Å(now 11.4,conf 0.34)
  - L12↔N17: targets 6.5/15.4Å but partners are 5.7Å apart → too_close_together by 3.3Å
  - N17↔E16: targets 15.4/12.1Å but partners are 1.5Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=13 · 3-10(G)=4 · coil(C)=7

```
CHHHGHHECEEHHHHEHHGECEEGCEHHHHHHHHHHCGECHEHCEEE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=9 · sheet=14
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - S8 ↔ Q22  (sheet)
  - S8 ↔ H23  (sheet)
  - C10 ↔ E16  (sheet)
  - C10 ↔ V20  (sheet)
  - C10 ↔ Q22  (sheet)
  - C10 ↔ H23  (sheet)
  - S11 ↔ E16  (sheet)
  - S11 ↔ V20  (sheet)
  - S11 ↔ Q22  (sheet)
  - S11 ↔ H23  (sheet)
  - G26 ↔ T45  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=155 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=55 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2657 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
