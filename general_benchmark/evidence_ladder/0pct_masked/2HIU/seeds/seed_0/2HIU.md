# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2HIU/sequence/2HIU.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/2HIU/seeds/seed_0/2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 1.068 A
- tm_score_ca_ordered: 0.8442927169861705
- heavy_atom_rmsd: 3.247 A
- sidechain_heavy_atom_rmsd: 3.999 A
- **all-atom quality (honest):** heavy 3.247 A, sidechain 3.999 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 990
- bin_accuracy: 0.695

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.0682243574135875
- ga_delta_rmsd: -0.03374562078530685  ga_fitness_mode: energy
- pre_local_rmsd: 1.2436479389761501  localized_anchor_rmsd: 1.0682903951626495

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Q22 → 9 conflicts (82%)
- explained: 9/11 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.128), conflicts/hub=1.8, max_incompat=2.76Å, chain_span=0.106
- **fix-first:** [LOW_CONFLICT] Root cause(s): Q22 — explain ~9/11 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N17** — severity 3.95, 3 conflict(s); suspect input ~`N21` (group: push_out)
  - push-out (wants farther): V20@18.2Å(now 15.4,conf 0.55), Q22@17.1Å(now 13.8,conf 0.55), N21@16.4Å(now 13.3,conf 0.55)
  - Q14↔N21: targets 6.0/16.4Å but partners are 7.7Å apart → too_close_together by 2.7Å
  - Q14↔Q22: targets 6.0/17.1Å but partners are 8.8Å apart → too_close_together by 2.3Å
  - Q22↔C10: targets 17.1/11.1Å but partners are 3.9Å apart → too_close_together by 2.2Å
- **Y18** — severity 2.33, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): Q22@17.6Å(now 15.0,conf 0.55)
  - L15↔Q22: targets 5.9/17.6Å but partners are 9.0Å apart → too_close_together by 2.8Å
  - Q22↔C10: targets 17.6/12.2Å but partners are 3.9Å apart → too_close_together by 1.5Å
- **Q14** — severity 2.23, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): N21@11.0Å(now 7.7,conf 0.55), Q22@12.1Å(now 8.8,conf 0.55)
  - C10↔Q22: targets 5.8/12.1Å but partners are 3.9Å apart → too_close_together by 2.3Å
  - S11↔Q22: targets 5.1/12.1Å but partners are 5.2Å apart → too_close_together by 1.8Å
- **E16** — severity 2.02, 2 conflict(s); suspect input ~`S11` (group: push_out)
  - push-out (wants farther): V20@15.3Å(now 12.3,conf 0.55), Q22@15.4Å(now 12.0,conf 0.55), N21@14.1Å(now 11.1,conf 0.55)
  - Q22↔S11: targets 15.4/8.2Å but partners are 5.2Å apart → too_close_together by 1.9Å
  - L12↔V20: targets 5.8/15.3Å but partners are 7.7Å apart → too_close_together by 1.8Å
- **C19** — severity 1.37, 1 conflict(s); suspect input ~`L15` (group: push_out)
  - push-out (wants farther): Q22@19.0Å(now 16.5,conf 0.56)
  - Q22↔L15: targets 19.0/7.5Å but partners are 9.0Å apart → too_close_together by 2.5Å
- **L15** — severity 0.84, 1 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): Q22@12.2Å(now 9.0,conf 0.55)
  - C10↔Q22: targets 6.8/12.2Å but partners are 3.9Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=9 · 3-10(G)=5 · coil(C)=3

```
CHHHGHHEEGEHHHHHHHHHHEHHGGHHHHHHHHHHHHHEEGCECEE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=17 · sheet=3
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - N17 ↔ N21  (helix)
  - V20 ↔ L24  (helix)
  - L24 ↔ H28  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - S8 ↔ Q22  (sheet)
  - I9 ↔ Q22  (sheet)
  - S11 ↔ Q22  (sheet)

## Solvent Accessibility (burial)

- buried=21 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=167 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=64 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8443 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
