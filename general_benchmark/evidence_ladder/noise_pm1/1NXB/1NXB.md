# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1NXB\seeds\seed_1\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 1.019 A
- tm_score_ca_ordered: 0.8981456030854559
- heavy_atom_rmsd: 2.556 A
- sidechain_heavy_atom_rmsd: 3.230 A
- **all-atom quality (honest):** heavy 2.556 A, sidechain 3.230 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 1653
- bin_accuracy: 0.655

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=1.3057418435304364 -> 1.1718833573511944 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.019315473459624
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.0269741692195364  localized_anchor_rmsd: 1.0192554748886964

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N4 → 15 conflicts (32%); S29 → 8 conflicts (17%); Y24 → 7 conflicts (15%)
- explained: 30/47 conflicts by 3 root cause(s)
- metrics: hubs=20 (frac 0.333), conflicts/hub=2.4, max_incompat=3.73Å, chain_span=0.983
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N4 + S29 + Y24 — explain ~30/47 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S8** — severity 6.23, 6 conflict(s); suspect input ~`N4` (group: pull_in)
  - pull-in (wants closer): N4@6.6Å(now 9.2,conf 0.39)
  - C16↔N4: targets 19.5/6.6Å but partners are 9.6Å apart → too_close_together by 3.3Å
  - S17↔N4: targets 22.6/6.6Å but partners are 12.7Å apart → too_close_together by 3.3Å
  - P18↔N4: targets 25.5/6.6Å but partners are 15.6Å apart → too_close_together by 3.3Å
- **N4** — severity 5.03, 8 conflict(s); suspect input ~`S17` (group: push_out)
  - pull-in (wants closer): S8@6.6Å(now 9.2,conf 0.39)
  - push-out (wants farther): P18@18.2Å(now 15.6,conf 0.37)
  - S8↔S17: targets 6.6/13.1Å but partners are 21.9Å apart → too_far_apart by 2.2Å
  - S8↔C40: targets 6.6/7.5Å but partners are 16.1Å apart → too_far_apart by 2.0Å
  - G19↔S8: targets 16.9/6.6Å but partners are 25.5Å apart → too_far_apart by 1.9Å
- **S29** — severity 4.31, 5 conflict(s); suspect input ~`N60` (group: pull_in)
  - pull-in (wants closer): P18@27.5Å(now 30.0,conf 0.98), G19@27.4Å(now 29.9,conf 0.94), N60@15.0Å(now 17.8,conf 0.34)
  - V58↔N60: targets 23.8/15.0Å but partners are 5.4Å apart → too_close_together by 3.4Å
  - C59↔N60: targets 22.3/15.0Å but partners are 4.2Å apart → too_close_together by 3.1Å
  - S56↔N60: targets 26.3/15.0Å but partners are 8.7Å apart → too_close_together by 2.6Å
- **Y24** — severity 3.07, 4 conflict(s); suspect input ~`G19` (group: push_out)
  - push-out (wants farther): G19@17.9Å(now 15.2,conf 0.36), W28@16.8Å(now 12.9,conf 0.35)
  - G41↔G19: targets 4.7/17.9Å but partners are 10.7Å apart → too_close_together by 2.6Å
  - W28↔Q27: targets 16.8/10.5Å but partners are 4.0Å apart → too_close_together by 2.3Å
  - L51↔W28: targets 6.2/16.8Å but partners are 8.4Å apart → too_close_together by 2.1Å
- **S56** — severity 1.88, 2 conflict(s); suspect input ~`C53` (group: push_out)
  - pull-in (wants closer): F31@27.5Å(now 31.2,conf 0.99), R32@27.2Å(now 30.1,conf 0.89)
  - push-out (wants farther): V45@21.0Å(now 18.1,conf 0.44), C23@9.3Å(now 6.5,conf 0.34)
  - V45↔C53: targets 21.0/7.7Å but partners are 9.6Å apart → too_close_together by 3.7Å
  - V45↔C42: targets 21.0/12.0Å but partners are 7.4Å apart → too_close_together by 1.6Å
- **W28** — severity 1.72, 2 conflict(s); suspect input ~`H25` (group: push_out)
  - push-out (wants farther): Y24@16.8Å(now 12.9,conf 0.35)
  - Y24↔H25: targets 16.8/9.8Å but partners are 3.7Å apart → too_close_together by 3.2Å
  - I36↔Y24: targets 5.3/16.8Å but partners are 9.7Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=25 · 3-10(G)=12 · coil(C)=13

```
CEGHEEHGEGCEGGCECCCEHEGEGGEEGEHEEECEEGECECEHGEHHCHCECEGECHHE
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=1 · sheet=45
  - T44 ↔ G48  (helix)
  - C2 ↔ T12  (sheet)
  - C2 ↔ C16  (sheet)
  - C2 ↔ E20  (sheet)
  - C2 ↔ S22  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ Y24  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ Y24  (sheet)
  - C16 ↔ S22  (sheet)
  - C16 ↔ Y24  (sheet)
  - E20 ↔ G39  (sheet)
  - S22 ↔ G39  (sheet)
  - S22 ↔ G41  (sheet)
  - Y24 ↔ I36  (sheet)
  - Y24 ↔ E37  (sheet)
  - Y24 ↔ G39  (sheet)
  - Y24 ↔ G41  (sheet)
  - Y24 ↔ P43  (sheet)
  - Q27 ↔ G33  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=213 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=134 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0401 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1NXB.ensemble.pdb`)
- RMSF mean=0.141Å max=0.604Å (per-residue in .per_residue.csv)
- most flexible residues: 31, 35, 19, 10, 15

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1NXB.pae.csv`
- mean=0.066Å · max=0.477Å · AlphaFold-PAE analog (low block = rigid unit/domain)
