# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_2\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 1.608 A
- tm_score_ca_ordered: 0.6095852270398547
- heavy_atom_rmsd: 3.185 A
- sidechain_heavy_atom_rmsd: 3.839 A
- **all-atom quality (honest):** heavy 3.185 A, sidechain 3.839 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 595
- bin_accuracy: 0.726

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E16-R19 → 60 conflicts (73%); S7 → 17 conflicts (21%)
- explained: 77/82 conflicts by 2 root cause(s)
- metrics: hubs=13 (frac 0.351), conflicts/hub=6.3, max_incompat=4.49Å, chain_span=0.946
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E16-R19 + S7 — explain ~77/82 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R19** — severity 12.22, 9 conflict(s); suspect input ~`G3` (group: pull_in)
  - pull-in (wants closer): G3@23.7Å(now 26.9,conf 0.58), P37@7.7Å(now 10.5,conf 0.46)
  - G3↔I22: targets 23.7/4.4Å but partners are 31.6Å apart → too_far_apart by 3.4Å
  - G1↔G3: targets 33.7/23.7Å but partners are 7.0Å apart → too_close_together by 3.0Å
  - G3↔G28: targets 23.7/12.9Å but partners are 40.4Å apart → too_far_apart by 3.8Å
- **E16** — severity 12.05, 11 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): G29@14.1Å(now 16.9,conf 0.44)
  - E2↔G29: targets 23.6/14.1Å but partners are 42.2Å apart → too_far_apart by 4.5Å
  - T4↔G29: targets 18.8/14.1Å but partners are 36.1Å apart → too_far_apart by 3.2Å
  - G29↔F5: targets 14.1/16.0Å but partners are 33.1Å apart → too_far_apart by 3.0Å
- **S7** — severity 11.67, 9 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): P37@20.9Å(now 23.8,conf 0.52)
  - P30↔P37: targets 35.3/20.9Å but partners are 10.6Å apart → too_close_together by 3.9Å
  - S31↔P37: targets 37.7/20.9Å but partners are 13.7Å apart → too_close_together by 3.2Å
  - P36↔P37: targets 27.2/20.9Å but partners are 3.5Å apart → too_close_together by 2.9Å
- **V18** — severity 11.50, 9 conflict(s); suspect input ~`S32` (group: push_out)
  - push-out (wants farther): E2@31.8Å(now 29.3,conf 0.76), S32@20.2Å(now 17.0,conf 0.50), W24@11.7Å(now 9.1,conf 0.44)
  - E2↔G3: targets 31.8/24.8Å but partners are 3.7Å apart → too_close_together by 3.4Å
  - S32↔L25: targets 20.2/9.3Å but partners are 7.5Å apart → too_close_together by 3.3Å
  - E2↔T4: targets 31.8/22.2Å but partners are 7.0Å apart → too_close_together by 2.5Å
- **E2** — severity 10.59, 8 conflict(s); suspect input ~`E16` (group: push_out)
  - push-out (wants farther): V18@31.8Å(now 29.3,conf 0.76)
  - V18↔E16: targets 31.8/23.6Å but partners are 4.3Å apart → too_close_together by 4.0Å
  - V18↔M13: targets 31.8/19.9Å but partners are 8.1Å apart → too_close_together by 3.8Å
  - V18↔E15: targets 31.8/24.0Å but partners are 5.1Å apart → too_close_together by 2.7Å
- **G3** — severity 10.39, 8 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): R19@23.7Å(now 26.9,conf 0.58)
  - G28↔R19: targets 41.2/23.7Å but partners are 14.3Å apart → too_close_together by 3.2Å
  - I22↔R19: targets 32.6/23.7Å but partners are 6.2Å apart → too_close_together by 2.8Å
  - S32↔R19: targets 42.9/23.7Å but partners are 16.7Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=11 · 3-10(G)=1 · coil(C)=4

```
CEEHCHHCHEHEHHHEHHHHHHHHEHHHEGHEHECEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=7 · sheet=9
  - L9 ↔ M13  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - R19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ N27  (helix)
  - N27 ↔ S31  (helix)
  - S10 ↔ E16  (sheet)
  - L25 ↔ S32  (sheet)
  - L25 ↔ A34  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - G29 ↔ A34  (sheet)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)
  - S32 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=102 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=10 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9049 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
