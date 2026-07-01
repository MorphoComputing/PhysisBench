# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 2.898 A
- tm_score_ca_ordered: 0.45718206752604157
- heavy_atom_rmsd: 4.460 A
- sidechain_heavy_atom_rmsd: 5.324 A
- **all-atom quality (honest):** heavy 4.460 A, sidechain 5.324 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 865
- bin_accuracy: 0.550

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=4.413027175654897 -> 3.037492427361181 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.8981293208167367
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.89813259617678  localized_anchor_rmsd: 2.89813259617678

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E16-N21 → 19 conflicts (49%); T45-P46 → 18 conflicts (46%)
- explained: 37/39 conflicts by 2 root cause(s)
- metrics: hubs=18 (frac 0.383), conflicts/hub=2.2, max_incompat=3.94Å, chain_span=0.851
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E16-N21 + T45-P46 — explain ~37/39 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G41** — severity 3.11, 4 conflict(s); suspect input ~`G26` (group: pull_in)
  - pull-in (wants closer): T45@6.8Å(now 10.4,conf 0.38), E16@15.4Å(now 18.2,conf 0.34)
  - T45↔G26: targets 6.8/18.6Å but partners are 9.2Å apart → too_close_together by 2.6Å
  - E3↔T45: targets 21.0/6.8Å but partners are 12.0Å apart → too_close_together by 2.1Å
  - T45↔S27: targets 6.8/16.3Å but partners are 7.5Å apart → too_close_together by 2.0Å
- **C10** — severity 2.48, 3 conflict(s); suspect input ~`V2` (group: push_out)
  - push-out (wants farther): P46@21.2Å(now 17.9,conf 0.44)
  - P46↔V2: targets 21.2/9.7Å but partners are 8.6Å apart → too_close_together by 2.9Å
  - P46↔I1: targets 21.2/9.4Å but partners are 9.0Å apart → too_close_together by 2.8Å
  - P46↔L24: targets 21.2/8.9Å but partners are 10.8Å apart → too_close_together by 1.5Å
- **Q4** — severity 2.25, 2 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): P46@18.5Å(now 13.0,conf 0.37), T45@18.4Å(now 14.5,conf 0.37)
  - I1↔P46: targets 5.5/18.5Å but partners are 9.0Å apart → too_close_together by 3.9Å
  - I1↔T45: targets 5.5/18.4Å but partners are 10.7Å apart → too_close_together by 2.2Å
- **C5** — severity 2.21, 2 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): P46@18.6Å(now 15.2,conf 0.37)
  - V2↔P46: targets 6.3/18.6Å but partners are 8.6Å apart → too_close_together by 3.7Å
  - P46↔I1: targets 18.6/7.4Å but partners are 9.0Å apart → too_close_together by 2.3Å
- **Q14** — severity 1.90, 2 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): P46@18.4Å(now 15.0,conf 0.37), N21@13.8Å(now 10.4,conf 0.34)
  - I1↔P46: targets 6.2/18.4Å but partners are 9.0Å apart → too_close_together by 3.2Å
  - S11↔N21: targets 6.4/13.8Å but partners are 5.2Å apart → too_close_together by 2.1Å
- **Q22** — severity 1.87, 3 conflict(s); suspect input ~`L12` (group: push_out)
  - push-out (wants farther): C19@19.1Å(now 15.9,conf 0.38), N17@17.9Å(now 15.3,conf 0.36), Y18@17.1Å(now 13.3,conf 0.35), E16@15.5Å(now 11.4,conf 0.34), L15@12.8Å(now 10.2,conf 0.34)
  - E16↔L12: targets 15.5/10.4Å but partners are 3.1Å apart → too_close_together by 2.0Å
  - Y18↔A32: targets 17.1/8.8Å but partners are 6.3Å apart → too_close_together by 2.0Å
  - Y18↔L33: targets 17.1/12.5Å but partners are 3.1Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=10 · 3-10(G)=7 · coil(C)=3

```
CHGHHHHEGGEHHHHHHHHECEEHHHGHHEHHHHGHEGCEHGEHHHE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=10 · sheet=14
  - V2 ↔ C6  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - L24 ↔ H28  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - A32 ↔ V36  (helix)
  - G41 ↔ T45  (helix)
  - S8 ↔ V20  (sheet)
  - S8 ↔ Q22  (sheet)
  - S8 ↔ H23  (sheet)
  - S11 ↔ V20  (sheet)
  - S11 ↔ Q22  (sheet)
  - S11 ↔ H23  (sheet)
  - V20 ↔ C37  (sheet)
  - Q22 ↔ V30  (sheet)
  - H23 ↔ V30  (sheet)
  - V30 ↔ C37  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=171 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=70 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2977 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
